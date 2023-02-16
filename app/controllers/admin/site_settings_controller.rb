module Admin
  class SiteSettingsController < Admin::BaseController

    def index
      respond_to do |format|
        format.html
        format.json do
          site_settings = SiteSetting.defined_fields

          response = site_settings.each_with_object([]) do |setting, memo|
            memo << {
              key: setting[:key],
              category: setting[:scope],
              default: setting[:default],
              type: setting[:type],
              readonly: setting[:readonly],
              value: SiteSetting.send(setting[:key]),
              options: setting[:options]
            } unless setting[:options][:hidden]
          end

        render json: { site_settings: response }
        end
      end
    end
    def create
      @errors = []
      setting_params.keys.each do |key|
        next if setting_params[key].nil?

        if key == 'site_logo'
          # Si el campo es el de la imagen del sitio, cargar y procesar la imagen
          logo_uploader = LogoUploader.new
          logo_uploader.store!(setting_params[key])
          SiteSetting.send("#{key}=", logo_uploader.url)
          SiteSetting.send("resized_#{key}=", logo_uploader.resized_logo.url)
        else
          # Si no, actualizar el valor de la configuración
          setting = SiteSetting.new(var: key)
          setting.value = setting_params[key].strip
          unless setting.valid?
            @errors << setting.errors.full_messages
          end
        end
      end

      if @errors.any?
        render json: { error: @errors.to_sentence }, status: :unprocessable_entity
      else
        setting_params.keys.each do |key|
          # Si el campo es el de la imagen del sitio, ya lo actualizamos, por lo que no necesitamos hacer nada aquí
          next if key == 'site_logo'

          SiteSetting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
        end

        render json: { message: I18n.t("js.core.success_settings") }, status: :ok
      end
    end

    private

    def setting_params
      params.require(:setting).permit(settings_keys.map(&:to_sym))
    end

    def settings_keys
      SiteSetting.keys
    end
  end
end
