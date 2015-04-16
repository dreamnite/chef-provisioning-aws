require 'spec_helper'

describe Chef::Resource::AwsEbsVolume do
  extend AWSSupport

  when_the_chef_12_server "exists", organization: 'foo', server_scope: :context do
    with_aws "when connected to AWS" do

      it "aws_ebs_volume 'test_volume' creates a key pair" do
        expect_recipe {
          aws_ebs_volume "test_volume" do
            availability_zone 'eu-west-1a'
            size 8
          end
        }.to create_an_aws_ebs_volume('test_volume')
         .and be_idempotent
      end

    end
  end
end