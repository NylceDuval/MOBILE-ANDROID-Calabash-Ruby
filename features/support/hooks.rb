AfterStep do |scenario|
  STEP_PAUSE = (ENV['STEP_PAUSE'] || 0.5).to_f
  sleep(STEP_PAUSE)
end

at_exit do
  ReportBuilder.configure do |config|
    date = Time.now.strftime('%m_%d_%H_%M_%S')
    config.input_path = "./reports/cucumber_json/"
    config.report_path = "./reports/cadastro_de_livro_#{date}"
    config.color = "green"
    config.additional_css = "./reports/css/style.css"
    config.report_title = "Cadastro de livro"
    config.include_images = true
  end
  ReportBuilder.build_report
end
