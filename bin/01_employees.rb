require_relative '../data/crm'
require 'pp'

result = []
CRM[:companies].each do |company|
  entry = {}
  entry[:name] = company[:name]
  entry[:employees] = []
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      # assemble here!
      if employment[:company_id] == company[:id]
        p_entry = {
          id: person[:id],
          first_name: person[:first_name],
          last_name: person[:last_name],
          title: employment[:title]
        }
        entry[:employees] << p_entry
      end
    end
    result << entry
  end
end
pp result

# result = CRM[:companies].each do |company|
#   {
#     name: company[:name],
#
#     employees: CRM[:people].flat_map do |person|
#       person[:employments].select do |employment|
#         employment[:company_id] == company[:id]
#       end.map do |employment|
#       {
#         id: person[:id],
#         first_name: person[:first_name],
#         last_name: person[:last_name],
#         title: employment[:title]
#       }
#     end
#   end
#   }
# end



# -------------------------
#
# Challenge #1 - employees of companies
#
# Write some code that will return an array of companies,
# and the people who work for them.  For example:
# [
#   {
#     name: "Nicolas and Sons",
#     employees: [
#       {
#         :id => 20,
#         :first_name => "Savannah",
#         :last_name => "Clementina",
#         :title => "Chief Communications Consultant"
#       },
#       {
#         :id => 46,
#         :first_name => "Elyse",
#         :last_name => "Jensen",
#         :title => "Human Directives Engineer"
#       },
#     ]
#   }
# ]
