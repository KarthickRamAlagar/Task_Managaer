# ✅ Task Management API (Rails 8)
This is a RESTful API for managing tasks and categories, built with Ruby on Rails. It supports full CRUD functionality, filtering by status and category, and is pre-seeded with realistic test data.
---
## 🚀 Base URL
```cmd
{{base_url}} = http://localhost:3000
```
##  🔁 Postman Setup (Optional)
Add this Postman Environment variable:
|variable|Initial Value|
|base_url|http://localhost:3000|
Use {{base_url}} in all request URLs.

---
## 📚 API Endpoints
| Title                        | Method | Endpoint                                         | Description                                |
|-----------------------------|--------|--------------------------------------------------|--------------------------------------------|
| Get All Tasks               | GET    | `{{base_url}}/api/v1/tasks`                     | Returns all tasks                          |
| Get Task by ID              | GET    | `{{base_url}}/api/v1/tasks/:id`                | Returns a specific task                    |
| Filter Tasks by Status      | GET    | `{{base_url}}/api/v1/tasks?status=pending`      | Filters by `pending`, `in_progress`, `completed` |
| Filter Tasks by Category    | GET    | `{{base_url}}/api/v1/tasks?category=2`          | Returns tasks by category ID               |
| Create Task                 | POST   | `{{base_url}}/api/v1/tasks`                     | Creates a new task                         |
| Update Task                 | PUT    | `{{base_url}}/api/v1/tasks/:id`                | Updates task fields                        |
| Delete Task                 | DELETE | `{{base_url}}/api/v1/tasks/:id`                | Deletes a task with success message        |
| Get All Categories          | GET    | `{{base_url}}/api/v1/categories`               | Returns all categories                     |
| Create Category             | POST   | `{{base_url}}/api/v1/categories`               | Creates a new category                     |
| Update Category             | PUT    | `{{base_url}}/api/v1/categories/:id`           | Updates category fields                    |
| Delete Category             | DELETE | `{{base_url}}/api/v1/categories/:id`           | Deletes category with success message      |

## 📥 Sample JSON Request Bodies

## Create Task

``` cmd
{
  "task": {
    "title": "Polish API docs",
    "description": "Write README and endpoint examples",
    "status": "pending",
    "due_date": "2025-07-08T12:00:00Z",
    "category_id": 1
  }
}

```

## Create Category
```cmd
{
  "category": {
    "name": "Health",
    "description": "Wellness-related tasks"
  }
}
```
## 🛡️ Error & Success Messages
| Scenario                    | Response Example                                      |
|-----------------------------|------------------------------------------------------|
| Task not found              | `{"error": "Task not found with ID 99"}`            |
| Category not found          | `{"error": "Category not found with ID 7"}`         |
| Successful delete (Task)    | `{"message": "Task with ID 5 was successfully deleted."}` |
| Successful delete (Category)| `{"message": "Category with ID 2 was successfully deleted."}` |
