require 'guard'
require 'guard/guard'

module Guard
  class JslintOnRails < Guard
    VERSION = '0.0.3'

    def run_on_change(paths)
      system "rake jslint paths=#{paths.join(',')}"
    end
  end
end
