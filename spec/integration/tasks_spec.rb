require 'swagger_helper'

RSpec.describe 'API', type: :request do
  path "/signup" do
    post "Signup" do
      tags "Signup"
      consumes "application/json", "application/xml"
      parameter name: :signup, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
          name: { type: :string }
        },
        required: ["email", "password"]
      }

      response "201", "signup successful" do
        let(:signup) { { email: "example@gmail.com", password: "password" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:signup) { { email: "example", password: "password" } }
        run_test!
      end
    end
  end

  path "/login" do
    post "Login" do
      tags "Login"
      consumes "application/json", "application/xml"
      parameter name: :login, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ["email", "password"]
      }

      response "200", "login successful" do
        let(:login) { { email: "example@gmail.com", password: "password" } }
        run_test!
      end

      response "401", "login failed" do
        let(:login) { { email: "example", password: "password" } }
        run_test!
      end
    end
  end

  path "/logout" do
    post "Logout" do
      tags "Logout"
      consumes "application/json", "application/xml"
      parameter name: :logout, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string }, 
          password: { type: :string }
        },
        required: ["email", "password"]
      }

      response "200", "logout successful" do
        let(:logout) { { email: "example@gmail.com", password: "password" } }
        run_test!
      end

      response "401", "logout failed" do
        let(:logout) { { email: "example", password: "wrongpassword" } }
        run_test!
      end
    end
  end

  path "/api/v1/tasks" do
    post "Creates a task" do
      tags "Tasks"
      consumes "application/json", "application/xml"
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          status: { type: :string },
          completed: { type: :boolean }
        },
        required: ["title", "description"]
      }

      response "201", "task created" do
        let(:task) { { title: "Becoming A Leader", description: "Learn to become a good leader" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:task) { { title: "Becoming A Leader" } }
        run_test!
      end
    end

    get "Retrieves all tasks" do
      tags "Tasks"
      produces "application/json", "application/xml"

      response "200", "tasks found" do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   status: { type: :string }
                 },
                 required: ["id", "name", "status"]
               }

        before { Task.create(name: "Test Task", status: "pending") }
        run_test!
      end
    end
  end

  path "/api/v1/tasks/{id}" do
    patch "Updates a task" do
      tags "Tasks"
      consumes "application/json", "application/xml"
      parameter name: :id, in: :path, type: :string 
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          status: { type: :string }
        },
        required: ["title", "description"]
      }

      response "200", "task updated" do
        let(:id) { Task.create(name: "Test Task", status: "pending").id }
        let(:task) { { title: "Learn to code", description: "Learn to code in Ruby" } }
        run_test!
      end
    end

    get "Retrieves a task" do
      tags "Tasks"
      produces "application/json", "application/xml"
      parameter name: :id, in: :path, type: :string

      response "200", "task found" do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 status: { type: :string }
               },
               required: ["id", "name", "status"]

        let(:id) { Task.create(name: "Test Task", status: "pending").id }
        run_test!
      end

      response "404", "task not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end

    delete "Deletes a task" do
      tags "Tasks"
      produces "application/json", "application/xml"
      parameter name: :id, in: :path, type: :string

      response "204", "task deleted" do
        let(:id) { Task.create(name: "Test Task", status: "pending").id }
        run_test!
      end

      response "404", "task not found" do
        let(:id) { "invalid" }
        run_test!
      end
    end
  end
end