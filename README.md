# PaperclipMp3

Paperclip Mp3 is a Paperclip post-processor that convert to mp3 file of the audio attachment .

    has_attached_file :sound,
          styles: {
                  mp3: {
                          format: :mp3,
                          :convert_options => {:ar => '44100', :ac => '2', :ab => '192000'},
                          :processors => [:mp3]
                  }
          }