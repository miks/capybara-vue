module Capybara
  module Vue
    class Waiter
      attr_accessor :page

      def initialize(page)
        @page = page
      end

      def wait_until_ready
        return unless vue_loaded?

        setup_ready

        start = Time.now
        until ready?
          timeout! if timeout?(start)
          setup_ready if page_reloaded_on_wait?
          sleep(0.01)
        end
      end

      private

      def timeout?(start)
        Time.now - start > Capybara.default_wait_time
      end

      def timeout!
        raise TimeoutError.new("timeout while waiting for vue")
      end

      def ready?
        page.evaluate_script("window.vueReady")
      end

      def vue_loaded?
        begin
          page.evaluate_script "(typeof Vue !== 'undefined')"
        rescue Capybara::NotSupportedByDriverError
          false
        end
      end

      def setup_ready
        page.execute_script <<-JS
          window.vueReady = false;
	  Vue.nextTick(function() {
            window.vueReady = true;
          });
        JS
      end
      
      def page_reloaded_on_wait?
        page.evaluate_script("window.vueReady === undefined")
      end
    end
  end
end
