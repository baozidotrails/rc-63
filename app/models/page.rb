class Page < ActiveRecord::Base

  validates :slug, uniqueness: true, presence: true,

                   # routes.rb
                   # get 'signup' and get 'login' will be triggered
                   # no longer trigger to pages#show
                   exclusion: { in: %w[signup login] }


  before_validation :generate_slug

  has_ancestry

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end
end
