require 'swagger_helper'

RSpec.describe 'api/v1/order', type: :request do

  path '/api/v1/order' do

    get('list orders') do
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

    post('create order') do
      consumes('application/json')
      produces('application/json')

      parameter(name: :order, in: :body, schema: {
        type: :object,
        properties: {
          model: { type: :string },
          imei: { type: :string },
          installments: { type: :integer },
          value: { type: :float },
          user_id: { type: :integer },
        },
        required: ['model', 'imei', 'installments', 'value', 'user_id'],
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

  path '/api/v1/order/{id}' do
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

    patch('update order') do
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

    put('update order') do
      consumes('application/json')
      produces('application/json')
      security([Bearer: {}])
      parameter(name: :user, in: :body, schema: {
        type: :object,
        properties: {
          model: { type: :string },
          imei: { type: :string },
          installments: { type: :integer },
          value: { type: :float },
          user_id: { type: :integer },
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

    delete('delete order') do
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
