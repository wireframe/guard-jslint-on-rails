require "guard"
require "guard/plugin"
require "guard/notifier"
require "jslint"

module Guard
  class JslintOnRails < Plugin
    VERSION = "0.2.0"

    def initialize(options={})
      super
      @config_path = File.join(Dir.pwd, options[:config_path] || "config/jshint.yml")
    end

    def start
      UI.info "Guard::JsLintOnRails started using config: #{@config_path}"
    end

    def run_on_change(paths)
      error = nil
      begin
        capture_output do
          lint = ::JSLint::Lint.new(
            :paths => paths,
            :config_path => @config_path
          )
          lint.run
        end
      rescue ::JSLint::LintCheckFailure => e
        error = e
      end
      Notifier.notify((error ? "failed" : "passed"), :title => "JSLint results", :image => (error ? :failed : :success))
      true
    end

    private
    def capture_output
      out = StringIO.new
      $stdout = out
      $stderr = out
      yield
      return out
    ensure
      $stderr = STDERR
      $stdout = STDOUT
    end
  end
end
