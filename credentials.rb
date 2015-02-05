module Credentials
  # This module contains (functional) placeholder credentials, use the
  # "set_credentials" rake task if you wish to replace these with your
  # own credentials.
  #
  # Note that storing your actual Klarna credentials in such a manner
  # is a very bad idea.

  def self.api_key
    'test_d8324b98-97ce-4974-88de-eaab2fdf4f14'
  end

  def self.api_secret
    'test_846853f798502446dbaf11ee8365fef2e533ddde1f5d6a6caa961398a776c08c'
  end
end
