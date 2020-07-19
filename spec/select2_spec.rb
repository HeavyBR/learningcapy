describe 'Select2', :select2 do
  
  describe('single') do
    before(:each) do
      visit '/apps/select2/single.html'
    end

    it 'should open the list and select an element with success' do
      find('.select2-selection--single').click

      # Find nessa classe, porém o elemento tem que dar match no text
      find('.select2-results__options', text: 'Adam Sandler').click
  
      sleep 3
    end

    it 'should open the list, search an actor and select the searched actor with success' do
      find('.select2-selection--single').click
      sleep 1

      find('.select2-search__field').set 'Chris Rock'
      sleep 1

      find('.select2-results__option').click
      sleep 4
    end
  end

  describe 'multi', :multi do
    before(:each) do
      visit '/apps/select2/multi.html'
    end

    it 'seleciona atores' do
      
      actors = ['Adam Sandler', 'Chris Rock', 'Kevin James']

      actors.each do |a|
        selectAndClickOnActor(a)
      end

      sleep 1
    end

    def selectAndClickOnActor (actor)
      find('.select2-selection--multiple').click
      find('.select2-search__field').set actor
      find('.select2-results__option').click
    end

  end
end