RSpec.describe 'Citizens', type: :request do
  subject(:citizen) { create :citizen }
  subject(:address) { create :address, citizen: citizen }

  describe 'when request list of all citizens' do
    it 'renders a successful response' do
      get '/citizens', headers: headers_html

      expect(response).to be_successful
    end

    it 'list registered citizens' do
      first_name = citizen.first_name
      get '/citizens', headers: headers_html

      expect(response.body).to include(first_name)
    end
  end

  describe 'when request a specific citizen' do
    context 'with success' do
      before(:each) do
        address
      end

      it 'renders a successful response' do
        get "/citizens/#{citizen.id}", headers: headers_html

        expect(response).to be_successful
      end

      it 'show the specific citizen' do
        first_name = citizen.first_name
        get "/citizens/#{citizen.id}", headers: headers_html

        expect(response.body).to include(first_name)
      end
    end
  end

  describe 'when create a citizen' do
    context 'with valid parameters' do
      before(:each) do
        post "/citizens", params: {
          citizen: {
            status: true,
            first_name: citizen.first_name,
            last_name: citizen.last_name,
            cpf: citizen.cpf,
            cns: citizen.cns,
            email: citizen.email,
            date_of_birth: citizen.date_of_birth,
            telephone: citizen.telephone,
            photo: citizen.photo,
            address_attributes: {
              city: address.city,
              complement: address.complement,
              fu: address.fu,
              ibge_code: address.ibge_code,
              neighborhood: address.neighborhood,
              public_place: address.public_place,
              zipcode: address.zipcode
            }
          }
        }, headers: { 'Accept' => 'text/html', 'Content-Type' => 'multipart/form-data' }
      end

      it 'redirects to the created citizen' do
        expect(response).to redirect_to(citizen_url(Citizen.last))
      end

      it 'creates a new Citizen' do
        expect change(Citizen, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        post "/citizens", params: {
          citizen: {
            status: true,
            first_name: citizen.first_name,
            last_name: citizen.last_name,
            cpf: '123',
            cns: citizen.cns,
            email: citizen.email,
            date_of_birth: citizen.date_of_birth,
            telephone: citizen.telephone,
            photo: citizen.photo,
            address_attributes: {
              city: address.city,
              complement: address.complement,
              fu: address.fu,
              ibge_code: address.ibge_code,
              neighborhood: address.neighborhood,
              public_place: address.public_place,
              zipcode: address.zipcode
            }
          }
        }, headers: { 'Accept' => 'text/html', 'Content-Type' => 'multipart/form-data' }
      end

      it 'renders a status 422' do
        expect(response.status).to eq(422)
      end

      it "does not create a new Citizen" do
        expect change(Citizen, :count).by(0)
      end
    end
  end

  describe 'when edit a citizen' do
    context 'with valid parameters' do
      before(:each) do
        put "/citizens/#{citizen.id}", params: {
          citizen: {
            first_name: 'novo nome'
          }
        }, headers: { 'Accept' => 'text/html', 'Content-Type' => 'multipart/form-data' }
      end

      it 'redirects to the created citizen' do
        expect(response).to redirect_to(citizen_url(citizen))
      end

      it 'creates a new Citizen' do
        citizen.reload
        expect(citizen.first_name).to eq('novo nome')
      end
    end
  end
end
