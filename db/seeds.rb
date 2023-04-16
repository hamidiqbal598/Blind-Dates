
if Employee.count == 0
  admin_user = Employee.new(email:'admin@admin.com',password:'12345678', role: 'admin')
  admin_user.save(:validate=>false)
end
employee1 = Employee.create([
                      { name: 'Hamid Iqbal', designation: 'Backend Engineer', department: 'engineering', email: 'hamidiqbal598@gmail.com' , password:'12345678', role: 'user', wants_to_go_lunch: true },
                      { name: 'Savita Hallikeri', designation: 'HR Manager', department: 'HR', email: 'shallikeri@dataguard.de' , password:'12345678', role: 'user', wants_to_go_lunch: true  },
                      { name: 'Hamid Khalifa', designation: 'Senior Backend Engineer', department: 'engineering', email: 'kh.hamidkhan@gmail.com' , password:'12345678', role: 'user', wants_to_go_lunch: true }
                    ])

FactoryBot.create_list(:employee, 50)

(1..2).each do |i|
  friday = DateTime.now - ((DateTime.now.wday - 5) % 7 + i*7)
  friday = DateTime.new(friday.year, friday.month, friday.day, 12, 0, 0)
  CreateDatesService.new(friday).call
end
BlindDate.all.each do |blind_date|
  blind_date.update!(restaurant: FAMOUS_RESTAURANTS[rand(FAMOUS_RESTAURANTS.count)])
end

friday = Date.today.next_day((5 - Date.today.wday) % 7)
date = DateTime.new(friday.year, friday.month, friday.day, 12, 0, 0)
CreateDatesService.new(date).call

