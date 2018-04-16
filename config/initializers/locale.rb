# La bibliothèque I18n devrait rechercher des fichiers de traduction ici
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{erb,rb,yml}')]

# Liste des locales autorisées par l’application
I18n.available_locales = [:en, :fr]

# Définit la locale par défaut
I18n.default_locale = :en
