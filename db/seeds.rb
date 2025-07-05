# 🧹 Reset DB and IDs
Task.destroy_all
Category.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('categories')
ActiveRecord::Base.connection.reset_pk_sequence!('tasks')

# 📚 Create Categories
work = Category.create!(id: 1, name: "Work", description: "Professional responsibilities")
personal = Category.create!(id: 2, name: "Personal", description: "Home and self tasks")
learning = Category.create!(id: 3, name: "Learning", description: "Skill development and study")

# 📝 Create Tasks (IDs 1–20)
Task.create!([
  { id: 1, title: "Write project proposal", description: "Draft and review client proposal", status: :pending, due_date: 2.days.from_now, category: work },
  { id: 2, title: "Fix login bug", description: "OAuth token failing", status: :in_progress, due_date: 1.day.from_now, category: work },
  { id: 3, title: "Deploy staging server", description: "Push build to Heroku", status: :pending, due_date: 3.days.from_now, category: work },
  { id: 4, title: "Grocery shopping", description: "Veggies, fruits, bread", status: :completed, due_date: Date.today, category: personal },
  { id: 5, title: "Morning yoga", description: "20-minute stretching routine", status: :pending, due_date: 1.day.from_now, category: personal },
  { id: 6, title: "Organize closet", description: "Declutter and donate old clothes", status: :in_progress, due_date: 2.days.from_now, category: personal },
  { id: 7, title: "Complete Rails tutorial", description: "Finish ActiveRecord module", status: :completed, due_date: 4.days.ago, category: learning },
  { id: 8, title: "Practice coding problems", description: "Binary trees and recursion", status: :pending, due_date: 5.days.from_now, category: learning },
  { id: 9, title: "Watch design patterns video", description: "Observer and Strategy", status: :pending, due_date: 3.days.from_now, category: learning },
  { id: 10, title: "Update resume", description: "Add recent projects", status: :completed, due_date: Date.yesterday, category: work },
  { id: 11, title: "Clean desktop", description: "Delete screenshots", status: :in_progress, due_date: Date.today, category: personal },
  { id: 12, title: "Plan trip budget", description: "Accommodation and food estimate", status: :pending, due_date: 6.days.from_now, category: personal },
  { id: 13, title: "Write unit tests", description: "Cover edge cases for service layer", status: :in_progress, due_date: 2.days.from_now, category: work },
  { id: 14, title: "Complete book chapter", description: "Finish Chapter 4 of 'Clean Code'", status: :completed, due_date: Date.yesterday, category: learning },
  { id: 15, title: "Refactor dashboard code", description: "Clean CSS grid layout", status: :pending, due_date: 1.day.from_now, category: work },
  { id: 16, title: "Walk the dog", description: "Evening park stroll", status: :completed, due_date: Date.today, category: personal },
  { id: 17, title: "Build API mock server", description: "Test with Postman collections", status: :pending, due_date: 2.days.from_now, category: work },
  { id: 18, title: "Research deployment tools", description: "Look into Netlify and Vercel", status: :in_progress, due_date: 4.days.from_now, category: learning },
  { id: 19, title: "Weekly meal plan", description: "Prep ingredients list", status: :pending, due_date: 2.days.from_now, category: personal },
  { id: 20, title: "Solve Leetcode challenge", description: "Daily graph problem", status: :completed, due_date: Date.today, category: learning }
])
ActiveRecord::Base.connection.execute("SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories))")
ActiveRecord::Base.connection.execute("SELECT setval('tasks_id_seq', (SELECT MAX(id) FROM tasks))")