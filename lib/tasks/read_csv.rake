require 'csv'

namespace :read_csv do
  desc 'Import data from a csv file and load it into the database'
  task load_data: :environment do

    CSV.foreach('public/csv/Code Challenge CRM data.csv', headers: true) do |row|
      
      current_company = Company.find_by(name: row['company'])
      current_stage = Stage.find_by(value: row['stage'])

      unless current_company.present?
        current_company = Company.create(name: row['company'])
      end

      unless current_stage.present?
        current_stage = Stage.create(value: row['stage'])
      end

      Prospect.create(first_name: row['first_name'],
        first_name: row['first_name'], 
        email: row['email'], 
        phone: row['phone'], 
        phone: row['phone'], 
        stage: current_stage,
        company: current_company
      )

    end
  end
end