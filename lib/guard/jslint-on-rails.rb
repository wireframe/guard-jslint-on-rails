require 'guard'
require 'guard/guard'
require 'jslint'

module Guard
  class JslintOnRails < Guard
    VERSION = '0.0.4'

    def run_on_change(paths)
      capture_output do
        lint = JSLint::Lint.new(
          :paths => paths,
          :config_path => File.join(Dir.pwd, 'config', 'jslint.yml')
        )
        lint.run #raises LintCheckFailure if failure
      end
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
