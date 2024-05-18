require "swagger_helper"

RSpec.describe 'Tasks API', type: :request do

    path "api/v1/tasks" do

        post "creates a task" do
            tags "Tasks"
            consumes "application/json", "application/xml"
            parameter name: :task, in: :body, schema: {
                type: :object,
                properties: {
                    title: { type: :string },
                    description: { type: :string },
                    status: { type: :string }
                },
                required: [ "title", "description" ]
            }

            response "201", "task created" do
                let(:task) { { title: "Becoming A Leader", description: "Lear to becoming a good leader" } }
                run_test!
            end

            response "422", "invalid request" do
                let(:task) { { title: "Becoming A Leader" } }
                run_test!
            end

        end
    end

    path '/api/v1/tasks/{id}' do
      get 'Retrieves a task' do
        tags 'Tasks'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string
  
        response '200', 'task found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   status: { type: :string }
                 },
                 required: ['id', 'name', 'status']
  
          let(:id) { Task.create(name: 'Test Task', status: 'pending').id }
          run_test!
        end
  
        response '404', 'task not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
