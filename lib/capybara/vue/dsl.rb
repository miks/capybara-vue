module Capybara
  module Vue
    module DSL
      include Capybara::DSL

      Capybara::Session::DSL_METHODS.each do |method|
        define_method(method) do |*args, **kwargs, &block|
          page.send(method, *args, **kwargs, &block)
        end
      end

      def page
        wait_until_vue_ready
        Capybara.current_session
      end

      def wait_until_vue_ready
        Waiter.new(Capybara.current_session).wait_until_ready
      end
    end
  end
end

