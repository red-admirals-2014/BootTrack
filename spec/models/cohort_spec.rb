require 'spec_helper'

describe Cohort do
    it { should have_many(:graduates) }
end