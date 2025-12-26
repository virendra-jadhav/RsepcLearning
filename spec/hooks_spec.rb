
require "User"

# # describe "Test Hooks" do
# #   #   it "test 1" do
# #   #   user = User.new
# #   #   user.activate
# #   # end

# #   # it "test 2" do
# #   #   user = User.new
# #   #   user.activate
# #   # end  
# #   #
# #   #
# #   append_before do
# #     puts "Runs append"
# #   end
# #   prepend_before do
# #     puts "Runs first"
# #   end

# #   before do
# #     puts "Runs later"
# #   end

# #   before do
# #     @user = User.new("Virendra")
# #   end

# #   it "has a name" do
# #     puts "test run"
# #     expect(@user.name).to eq("Virendra")
# #   end

# #   around do |example|
# #     puts "Before example"
# #     example.run
# #     puts "After example"
# #   end

# #   # execution order: 
# #   # Before example
# # # Runs first
# # # Runs append
# # # Runs later
# # # test run
# # # After example

# # end




# describe "Hooks order" do
#   before(:all) { puts "before all" }
#   before(:each) { puts "before each" }

#   it "test 1" do
#     puts "test 1"
#   end

#   it "test 2" do
#     puts "test 2"
#   end

#   after(:each) { puts "after each" }
#   after(:all) { puts "after all" }

#   # execution order: 
#   # before all
# # before each
# # test 1
# # after each
# # .before each
# # test 2
# # after each
# # .after all


# end


# Nested Hooks (very common)
describe User do
  before { puts "outer before" }

  context "when active" do
    before { puts "inner before" }

    it "works" do
      puts "example"
    end
  end

  # Execution order:
  # outer before
  # inner before
  # example
end
