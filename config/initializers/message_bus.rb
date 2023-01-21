Rails.application.config do |config|
    MessageBus.configure(backend: :memory)
end