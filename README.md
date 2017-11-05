
# Content Scraper

This is an **API** app only for scraping a page then it retrieves the contents and saves it to the database.
The contents that will be saved are contents from the tags :
* h1
* h2
* h3
* anchor

## Endpoints
There will be two endpoints :
* **GET** /api/v1/pages
* **POST** /api/v1/pages

#### GET

The **GET** request will return all the pages including the contents of the tags.

Example of the response for this endpoint:

```json
[
    {
        "id": 1,
        "page_url": "https://www.kumpul.co",
        "tags": [
            {
                "id": 1,
                "content": "Title Header",
                "content_type": "h1"
            }
        ]
    }
]
```

#### POST
The **POST** request requires one parameter: `page_url`, and the response will return the result of the scraping.

Example of the response for this endpoint:
```json
[
    {
        "id": 2,
        "page_url": "https://www.kumpul.co/about",
        "tags": [
            {
                "id": 2,
                "content": "/",
                "content_type": "anchor"
            }
        ]
    }
]
```

## Gems
This is the list of the gems that are used in this app:
* Ruby v2.4.1
* Rails v5.1.4

#### API Development
* [Grape](https://github.com/ruby-grape/grape)
* [Grape Entity](https://github.com/ruby-grape/grape-entity) (for serializing)
* Nokogiri (for scraping)

#### Testing
* Rspec
* Shoulda Matchers
* VCR
* Factory Girls (Need to update to factory bot)
* Faker
* Database Cleaner

## Testing
To run the test you can just simply run `rspec`
