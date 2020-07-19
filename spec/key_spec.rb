describe 'key', :key do
    
    before(:each) do
        visit '/key_presses'
    end

    it 'enviando teclas' do

        find('#campo-id').send_keys :space

        expect(page).to have_content 'You entered: SPACE'
    end

    it 'enviando multiplas teclas' do
        
        teclas = %i[tab escape space enter shift control alt]

        teclas.each do |key|
            find('#campo-id').send_keys key
            expect(page).to have_content "You entered: #{key.to_s.upcase}"
        end 
    end

    it 'enviando letras' do
        letras = %w[a s d f g h j k l]
        letras.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content "You entered: #{l.to_s.upcase}"
        end 
    end

end