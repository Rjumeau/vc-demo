# lib/tasks/benchmark.rake
namespace :benchmark do
  desc "Run View Component vs Partial benchmark"
  task :components => :environment do
    require "benchmark/ips"

    ENV["RAILS_ENV"] = "production" unless Rails.env.production?
    Rails.logger.level = 1

    class BenchmarksController < ActionController::Base
      def request
        @request ||= ActionDispatch::Request.new({
          'HTTP_HOST' => 'localhost:3000',
          'REQUEST_METHOD' => 'GET',
          'PATH_INFO' => '/',
          'rack.url_scheme' => 'http'
        })
      end
    end

    BenchmarksController.view_paths = [
      Rails.root.join("app", "views"),
      Rails.root.join("app", "components")
    ]

    controller = BenchmarksController.new
    controller_view = controller.view_context

    Benchmark.ips do |x|
      x.time = 10
      x.warmup = 2

      x.report("user_card_component") {
        controller_view.render(Card::UserComponent.new(user: User.last))
      }

      x.report("user_card_partial") {
        controller_view.render("users/user_card", user: User.last)
      }

      x.compare!
    end
  end
end
