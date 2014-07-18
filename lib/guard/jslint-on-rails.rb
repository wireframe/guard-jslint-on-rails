require 'guard'
require 'guard/guard'
require 'guard/notifier'
require 'jslint'
require 'yaml'

module Guard
  class JslintOnRails < Guard

    def initialize(watchers=[], options={})
      super
      @config_path = File.join(Dir.pwd, options[:config_path] || 'config/jslint.yml')
      @config_file = YAML.load_file(@config_path)
      @default_paths = @config_file['paths']
    end

    def start
      UI.info "Guard::JsLintOnRails started using config: #{@config_path}"
      run_all if options[:all_on_start]
    end

    def run_all
      error = nil
      begin
        lint = ::JSLint::Lint.new(:paths => @default_paths, :config_path => @config_path)
        lint.run
      rescue ::JSLint::LintCheckFailure => e
        error = e
      end
      Notifier.notify((error ? 'failed' : 'passed'), :title => 'JSLint results', :image => (error ? :failed : :success))
      true
    end

    def run_on_change(paths)
      error = nil
      begin
        output = capture_output do
          lint = ::JSLint::Lint.new(
            :paths => paths,
            :config_path => @config_path 
          )
          lint.run
        end
      rescue ::JSLint::LintCheckFailure => e
        error = e
      end
      Notifier.notify((error ? 'failed' : 'passed'), :title => 'JSLint results', :image => (error ? :failed : :success))
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
