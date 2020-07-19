describe 'Alerts', :alert do
    
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
    end 
    
    it 'sim confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

        
    it 'não confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end


    it 'prompt' do

        accept_prompt(with: 'Fernando') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Fernando'
    end

    it 'dismiss prompt', :dismiss do
        dismiss_prompt do
            click_button 'Prompt'
        end

        expect(page).to_not have_content 'Fernando'
        expect(page).to have_content 'Olá, null'
    end

end