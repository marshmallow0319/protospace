# User

### association
`has_many :prototypes, :comments, :likes`

## table
- id :integer
- created_at :timestamp
- updated_at :timestamp
- username :string
- email :string
- password :string
- member :string
- profile :text
- works :text


# Prototype

## association
`has_many :photos, :comments, :likes`
`belongs_to :user`

## table
- id :integer
- created_at :timestamp
- updated_at :timestamp
- user_id :integer
- title :string
- catch :string
- concept :text

# Photo

## association
`belongs_to :prototype`

## table
- id :integer
- created_at :timestamp
- updated_at :timestamp
- prototype_id :integer
- image_url :string
- status :integer
> 0 :main, 1 :sub


# Comment

## association
`belongs_to :user, :prototype`

## table
- id :integer
- created_at :timestamp
- updated_at :timestamp
- user_id :integer
- prototype_id :integer
- content :text


# Like
### association
`belongs_to :user, prototype`

## table
- id :integer
- created_at :timestamp
- updated_at :timestamp
- user_id :integer
- prototype_id :integer
