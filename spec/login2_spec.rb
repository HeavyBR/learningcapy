describe 'Login 2', :login2 do
    
    before(:each) do
        visit '/login2'
    end


    it 'com data de nascimento' do

        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'

        loginForm = find('#login')

        case loginForm.text
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Ano/
            find('#year').set '1970'
        end

        click_button 'Login'
        expect(find('#flash')).to have_Content 'Olá, Tony Stark. Você acessou a área logada!'
    end
end