module ListingsHelper
    def display_image(listing)
        link_to listing do
          if listing.image.attached?
            image_tag listing.image, style: 'width: 200px; max-height: 140px;', class: 'img-thumbnail'
          else
            image_tag "azteca.png", class: 'img-thumbnail'
          end
        end
    end

    def display_card_image(listing)
        if listing.image.attached?
            image_tag listing.image, class: 'grid-image card-img-top'
        else
            image_tag "azteca.png", class: 'grid-image card-img-top'
        end  
    end

end
