import Vue from 'vue/dist/vue.esm';
import TurbolinksAdapter from 'vue-turbolinks';
import axios from 'axios';

export default document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common['X-CSRF-Token'] = document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content');
  const element = document.getElementById('products');

  if (element !== null) {
    Vue.component('product-row', {
      template: '#product-row',
      mixin: [TurbolinksAdapter],
      props: {
        product: Object,
      },
      data() {
        return {
          editMode: false,
          errors: {},
          productRow: this.product,
        };
      },
      computed: {
        changeproductRow: {
          get() {
            this.productRow;
          },
          set(data) {
            this.productRow = data;
          },
        },
      },
      methods: {
        // toggle the product status which also updates
        // the  product in the database
        toggleManagerStatus() {
          this.product.manager = !this.product.manager;
          this.updateproduct();
        },

        // ajax call to update an product
        updateproduct() {
          axios
            .put(`/products/${this.product.id}.json`, {
              product: this.product,
            })
            .then(response => {
              // Turbolinks.visit(`/products`);
              this.errors = {};
              this.productRow = response.data;
              this.editMode = false;
            })
            .catch(error => {
              this.errors = error.response && error.response.data;
            });
        },

        fireproduct() {
          axios
            .delete(`/products/${this.product.id}.json`)
            .then(response => Turbolinks.visit(`/products`))
            .catch(error => console.log(error));
        },
      },
    });

    const products = new Vue({
      el: element,
      mixin: [TurbolinksAdapter],
      data() {
        return {
          products: [],
          product: {
            name: '',
            description: '',
          },
          errors: {},
        };
      },
      created() {
        axios
          .get('/products.json')
          .then(response => (this.products = response.data))
          .catch(error => console.log(error));
      },
      methods: {
        hireproduct() {
          axios
            .post('/products.json', {
              product: this.product,
            })
            .then(response => {
              this.errors = {};
              this.products.push(response.data);
            })
            .catch(error => {
              this.errors = error.response.data;
            });
        },
      },
    });
  }
});