require 'guard'
require 'guard/guard'
require 'guard/notifier'
require 'jslint'

module Guard
  class JslintOnRails < Guard
    VERSION = '0.0.7'

    def run_on_change(paths)
      error = nil
      begin
        output = capture_output do
          lint = JSLint::Lint.new(
            :paths => paths,
            :config_path => File.join(Dir.pwd, 'config', 'jslint.yml')
          )
          lint.run
        end
      rescue JSLint::LintCheckFailure => e
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
