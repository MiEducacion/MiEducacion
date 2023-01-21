class SiteSetting < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :data_type
  
    def self.load_settings
      settings = YAML.load_file("#{Rails.root}/config/site_settings.yml")
  
      settings.each do |category, settings|
        settings.each do |name, value|
          if value.is_a?(Hash)
            setting = SiteSetting.find_or_create_by(name: name)
            setting.value = value['default'] if setting.value.nil?
            setting.data_type = value['type']
            setting.description = ""
            setting.save
          end
        end
      end
      
    end
  end

  def self.method_missing(method, *args, &block)
    if method.to_s.end_with?('=')
      # Si el método termina con un signo igual (=), es un setter
      # Ejemplo: SiteSetting.site_title = 'Mi título'
      setting_name = method.to_s.chomp('=') # Eliminamos el signo igual para obtener el nombre del ajuste
      setting = SiteSetting.find_by(name: setting_name)
      if setting
        setting.update(value: args.first)
      else
        SiteSetting.create(name: setting_name, value: args.first)
      end
    else
      # Si el método no termina con un signo igual, es un getter
      # Ejemplo: SiteSetting.site_title
      setting = SiteSetting.find_by(name: method.to_s)
      if setting
        setting.value
      else
        super
      end
    end
  end

  
  # Llama al método load_settings en algún lugar de tu aplicación Rails para cargar
  # los ajustes del sitio desde el archivo YAML y establecer la categoría para cada ajuste.
  # Por ejemplo, puedes llamar al método en un controlador o en una clase de configuración
  # al inicio de la aplicación.
  SiteSetting.load_settings
  