# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sortable_element_for_nested_set}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robin Spainhour"]
  s.date = %q{2009-05-29}
  s.description = %q{Rails plugin for using script.aculo.us sortable_element for trees backed by nested sets.}
  s.email = %q{robin@robinspainhour.com}
  s.extra_rdoc_files = ["tasks/sortable_element_for_nested_set_tasks.rake", "lib/tree_calc.rb", "lib/sortable_element_for_nested_set.rb", "lib/sortable_element_for_nested_set_helper.rb", "README.rdoc"]
  s.files = ["tasks/sortable_element_for_nested_set_tasks.rake", "init.rb", "lib/tree_calc.rb", "lib/sortable_element_for_nested_set.rb", "lib/sortable_element_for_nested_set_helper.rb", "README.rdoc", "Rakefile", "spec/helpers/sortable_element_for_nested_set_helper_spec.rb", "spec/railsenv/app/controllers/application_controller.rb", "spec/railsenv/config/routes.rb", "spec/railsenv/config/initializers/backtrace_silencers.rb", "spec/railsenv/config/initializers/mime_types.rb", "spec/railsenv/config/initializers/inflections.rb", "spec/railsenv/config/initializers/session_store.rb", "spec/railsenv/config/initializers/new_rails_defaults.rb", "spec/railsenv/config/environment.rb", "spec/railsenv/config/locales/en.yml", "spec/railsenv/config/boot.rb", "spec/railsenv/config/database.yml", "spec/railsenv/config/environments/development.rb", "spec/railsenv/config/environments/test.rb", "spec/railsenv/config/environments/production.rb", "spec/railsenv/db/test.sqlite3", "spec/spec_helper.rb", "spec/sortable_element_for_nested_set_spec.rb", "spec/spec.opts", "spec/controllers/sorting_controller_spec.rb", "spec/models/tree_move_calculator_spec.rb", "Manifest", "sortable_element_for_nested_set.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/robinsp/sortable_element_for_nested_set}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Sortable_element_for_nested_set", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sortable_element_for_nested_set}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Rails plugin for using script.aculo.us sortable_element for trees backed by nested sets.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0", "= 1.2.4"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0", "= 1.2.4"])
      s.add_development_dependency(%q<mocha>, [">= 0", "= 0.9.5"])
    else
      s.add_dependency(%q<rspec>, [">= 0", "= 1.2.4"])
      s.add_dependency(%q<rspec-rails>, [">= 0", "= 1.2.4"])
      s.add_dependency(%q<mocha>, [">= 0", "= 0.9.5"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0", "= 1.2.4"])
    s.add_dependency(%q<rspec-rails>, [">= 0", "= 1.2.4"])
    s.add_dependency(%q<mocha>, [">= 0", "= 0.9.5"])
  end
end
