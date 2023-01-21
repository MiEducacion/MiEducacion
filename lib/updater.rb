# lib/update.rb

module MiEducacion
    module Updater
        def self.run_update
            # Inicializa la variable progress en 0
            progress = 0
            # Ejecuta el primer comando y actualiza la variable progress
            output = ""
            IO.popen("git pull") do |io|
              while (line = io.gets) do
                output << line
                puts line # Esto imprime el output en tiempo real
              end
            end
            progress += 25
            # Ejecuta el segundo comando y actualiza la variable progress
            IO.popen("bundle install") do |io|
              while (line = io.gets) do
                output << line
                puts line # Esto imprime el output en tiempo real
              end
            end
            progress += 50

            IO.popen("rake db:migrate") do |io|
                while (line = io.gets) do
                  output << line
                  puts line # Esto imprime el output en tiempo real
                end
            end

            progress += 65
            IO.popen("rake db:migrate") do |io|
                while (line = io.gets) do
                  output << line
                  puts line # Esto imprime el output en tiempo real
                end
            end

            progress += 80

            IO.popen("rake assets:precompile") do |io|
                while (line = io.gets) do
                  output << line
                  puts line # Esto imprime el output en tiempo real
                end
            end

            progress += 100

            system("rails restart")

            # Devuelve el porcentaje final de la barra de progreso y el output de los comandos
            [progress, output]
          end

      def self.remote_version
        remote_hash = `git ls-remote --heads origin main`.strip.split.first
        remote_hash
      end

      def self.updates_available?
        MiEducacion.git_version != remote_version
      end

      def self.versions_diff  
        commits = `git rev-list #{ MiEducacion.git_version}..#{remote_version}`
  
        commits.split("\n").count
      end

  
  
      private

    
      def self.recompile_assets
        # Implementa la lógica para recompilar los assets
        system("rails assets:precompile")

      end
  
      def self.run_migrations
        # Implementa la lógica para ejecutar las migraciones
        system("rake db:migrate")
      end
  
      def self.restart_server
        # Implementa la lógica para reiniciar el servidor
        system("rails restart")
      end
    end
  end
  