module Paperclip
    class Mp3 < Processor
        def initialize file, options = {}, attachment = nil
            super

            @basename = File.basename(file.path)
            @mp3_opts = {:ar => '44100', :ac => '2', :ab => '128000'}
            @mp3_opts = @mp3_opts.merge!(options[:convert_options])
        end

        def make
            mp3 = Tempfile.new [@basename, '.mp3']
            mp3.binmode

            begin
                Paperclip.run("ffmpeg", "-y -i :source -vn -acodec libmp3lame -ar :ar -ac :ac -ab :ab :dest", :source => "#{File.expand_path(file.path)}",
                              :ar => @mp3_opts[:ar], :ac => @mp3_opts[:ac], :ab => @mp3_opts[:ab], :dest => File.expand_path(mp3.path))
            rescue Cocaine::ExitStatusError => e
                raise Paperclip::Error, "error while processing mp3 for #{@basename}: #{e}"
            end

            mp3
        end
    end
end