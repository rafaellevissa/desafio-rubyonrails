require 'swagger_helper'

RSpec.describe 'api/v1/user', type: :request do

  path '/api/v1/user' do

    get('list users') do
      produces('application/json')

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create user') do
      consumes('application/json')
      produces('application/json')

      parameter(schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
        },
        required: ['name', 'cpf', 'email'],
      })

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/user/{id}' do
    # You'll want to customize the parameter types...
    parameter(name: 'id', in: :path, type: :string, description: 'id')
    
    get('show user') do
      produces('application/json')
      security([Bearer: {}])
      response(200, 'successful') do

        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update user') do
      produces('application/json')
      response(200, 'successful') do
        let(:id) { '123' }


        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update user') do
      consumes('application/json')
      produces('application/json')
      security([Bearer: {}])
      parameter(schema: {
        type: :object,
        properties: {
          name: { type: :string },
          cpf: { type: :string },
          email: { type: :string },
        }
      })
      response(200, 'successful') do
        let(:id) { '123' }


        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete user') do
      produces('application/json')
      security([Bearer: {}])
      response(200, 'successful') do
        let(:id) { '123' }


        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
