crumb :root do
  link "Início", root_path
end

crumb :animals do
  link "Animais", animals_path
end

crumb :animal do |animal|
  link animal.name, animal
  parent :animals
end

crumb :donors do
  link "Doadores de semen", donors_path
end

crumb :properties do
  link "Propriedades", properties_path
end

crumb :property do |property|
  link property.name, property
  parent :properties
end

crumb :lots do
  link "Rebanhos", lots_path
end

crumb :profiles do
  link "PErfis", profiles_path
end

crumb :profile do |profile|
  link profile.name, profile
  parent :profiles
end

crumb :notifications do
  link "Notificações", notifications_path
end

crumb :productions do
  link "Produções", productions_path
end

crumb :diseases do
  link "Doenças", diseases_path
end

crumb :disease do |disease|
  link disease.VulgarName, disease
  parent :diseases
end

crumb :drugs do
  link "Medicamentos", drugs_path
end

crumb :drug do |drug|
  link drug.name, drug
  parent :drugs
end

crumb :illnesses do
  link "Enfermidades", illnesses_path
end

crumb :illness do |illness|
  link drug.name, illness
  parent :illnesses
end

crumb :treatments do
  link "Tratamentos", treatments_path
end

crumb :treatment do |treatment|
  link treatment.name, treatment
  parent :treatments
end


crumb :employees do
  link "Empregados", employees_path
end

crumb :employee do |employee|
  link employee.name, employee
  parent :employees
end

crumb :shipments do
  link "Carregamentos de leite", shipments_path
end

crumb :shipment do |shipment|
  link shipment.date, shipment
  parent :shipments
end


crumb :analyses do
  link "Analises de leite", analyses_path
end

crumb :analysis do |analysis|
  link analysis.codeanalysis, analysis
  parent :analyses
end

crumb :bins do
  link "Silos", bins_path
end

crumb :bin do |bin|
  link "#{bin.id} - #{bin.capacity} - #{bin.kind}", bin
  parent :bins
end

crumb :stocks do
  link "Estocagem", stocks_path
end

crumb :stock do |stock|
  link stock.feed.name, stock
  parent :stocks
end

crumb :feeds do
  link "Alimento", feeds_path
end

crumb :feed do |feed|
  link feed.name, feed
  parent :feeds
end

crumb :diets do
  link "Dieta", diets_path
end

crumb :diet do |diet|
  link diet.name, diet
  parent :diets
end
  


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
