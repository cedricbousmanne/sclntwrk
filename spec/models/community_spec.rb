require 'spec_helper'

describe Community do
  it "validates presence of name" do
    build(:community, name: nil).should have(1).error_on(:name)
  end
  it "validates presence of domain" do
    build(:community, domain: nil).should have(2).error_on(:domain)
  end
  it "validates format of domain" do
    build(:community, domain: "foo"                ).should have(1).error_on(:domain)
    build(:community, domain: "zttp://foo.com"     ).should have(1).error_on(:domain)
    build(:community, domain: "http:/foo.com"      ).should have(1).error_on(:domain)
    build(:community, domain: "http::/foo.com"     ).should have(1).error_on(:domain)
    build(:community, domain: "http:foo.com"       ).should have(1).error_on(:domain)
    build(:community, domain: "http/foo.com"       ).should have(1).error_on(:domain)
    build(:community, domain: "http://foo.com"     ).should have(1).error_on(:domain)
    build(:community, domain: "http://www.foo.com" ).should have(1).error_on(:domain)
    build(:community, domain: "http://w.foo.com"   ).should have(1).error_on(:domain)
    build(:community, domain: "http://w.foo.co.nz" ).should have(1).error_on(:domain)
    build(:community, domain: "https://foo.com"    ).should have(1).error_on(:domain)
    build(:community, domain: "https://www.foo.com").should have(1).error_on(:domain)
    build(:community, domain: "https://w.foo.com"  ).should have(1).error_on(:domain)
    build(:community, domain: "https://w.foo.co.nz").should have(1).error_on(:domain)

    build(:community, domain: "foo.com"                         ).should have(0).error_on(:domain)
    build(:community, domain: "www.foo.com"                     ).should have(0).error_on(:domain)
    build(:community, domain: "community.greenlab-coworking.com").should have(0).error_on(:domain)
    build(:community, domain: "test1.com"                       ).should have(0).error_on(:domain)

  end
end
