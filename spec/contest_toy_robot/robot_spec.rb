require "spec_helper"

RSpec.describe ContestToyRobot::Robot do
   describe "command" do
      context "place" do
         context "when matches board" do
            it "puts subject to baord" do
               subject.do("PLACE 0,0,NORTH")

               expect(subject).to be_placed
               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:north)
            end
         end

         context "after another place" do
            before { subject.do("PLACE 0,0,EAST") }

            it "puts subject to board again" do
               subject.do("PLACE 4,4,SOUTH")

               expect(subject).to be_placed
               expect(subject.x_position).to eq(4)
               expect(subject.y_position).to eq(4)
               expect(subject.direction).to eq(:south)
            end
         end

         it "ignores to put subject to board when x position is too large" do
            subject.do("PLACE 5,0,NORTH")

            expect(subject).to_not be_placed
            expect(subject.x_position).to be_nil
            expect(subject.y_position).to be_nil
            expect(subject.direction).to be_nil
         end

         it "ignores to put subject to board when x position is negative" do
            subject.do("PLACE -1,0,NORTH")

            expect(subject).to_not be_placed
            expect(subject.x_position).to be_nil
            expect(subject.y_position).to be_nil
            expect(subject.direction).to be_nil
         end

         it "ignores to put subject to board when y position is too large" do
            subject.do("PLACE 0,5,NORTH")

            expect(subject).to_not be_placed
            expect(subject.x_position).to be_nil
            expect(subject.y_position).to be_nil
            expect(subject.direction).to be_nil
         end

         it "ignores to put subject to board when y position is negative" do
            subject.do("PLACE 0,-1,NORTH")

            expect(subject).to_not be_placed
            expect(subject.x_position).to be_nil
            expect(subject.y_position).to be_nil
            expect(subject.direction).to be_nil
         end

         it "ignores to put subject to board when facing is invalid" do
            subject.do("PLACE 0,0,NORDIC")

            expect(subject).to_not be_placed
            expect(subject.x_position).to be_nil
            expect(subject.y_position).to be_nil
            expect(subject.direction).to be_nil
         end
      end

      context "move" do
         context "from west point" do
            before { subject.do("PLACE 0,0,EAST") }

            it "moves subject to east" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(1)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:east)
            end
         end

         context "from east point" do
            before { subject.do("PLACE 4,0,EAST") }

            it "ignores to move subject to west" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(4)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:east)
            end
         end

         context "from east point" do
            before { subject.do("PLACE 4,0,WEST") }

            it "moves subject to east" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(3)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:west)
            end
         end

         context "from west point" do
            before { subject.do("PLACE 0,0,WEST") }

            it "ignores to move subject to west" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:west)
            end
         end

         context "from south point" do
            before { subject.do("PLACE 0,0,NORTH") }

            it "moves subject to north" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(1)
               expect(subject.direction).to eq(:north)
            end
         end

         context "from north point" do
            before { subject.do("PLACE 0,4,NORTH") }

            it "ignores to move subject to south" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(4)
               expect(subject.direction).to eq(:north)
            end
         end

         context "from north point" do
            before { subject.do("PLACE 0,4,SOUTH") }

            it "moves subject to north" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(3)
               expect(subject.direction).to eq(:south)
            end
         end

         context "from south point" do
            before { subject.do("PLACE 0,0,SOUTH") }

            it "ignores to move subject to south" do
               subject.do("MOVE")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:south)
            end
         end
         
         context "outside the board" do
            it "ignores to move subject" do
               subject.do("MOVE")

               expect(subject).to_not be_placed
               expect(subject.x_position).to be_nil
               expect(subject.y_position).to be_nil
               expect(subject.direction).to be_nil
            end
         end
      end

      context "left" do
         context "from south facing" do
            before { subject.do("PLACE 0,0,SOUTH") }

            it "turns subject from south" do
               subject.do("LEFT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:east)
            end
         end

         context "from east facing" do
            before { subject.do("PLACE 0,0,EAST") }

            it "turns subject from east" do
               subject.do("LEFT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:north)
            end
         end

         context "from north facing" do
            before { subject.do("PLACE 0,0,NORTH") }

            it "turns subject from north" do
               subject.do("LEFT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:west)
            end
         end

         context "from west facing" do
            before { subject.do("PLACE 0,0,WEST") }

            it "turns subject from west" do
               subject.do("LEFT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:south)
            end
         end
      end

      context "right" do
         context "from south facing" do
            before { subject.do("PLACE 0,0,SOUTH") }

            it "turns subject from south" do
               subject.do("RIGHT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:west)
            end
         end

         context "from east facing" do
            before { subject.do("PLACE 0,0,EAST") }

            it "turns subject from east" do
               subject.do("RIGHT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:south)
            end
         end

         context "from north facing" do
            before { subject.do("PLACE 0,0,NORTH") }

            it "turns subject from north" do
               subject.do("RIGHT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:east)
            end
         end

         context "from west facing" do
            before { subject.do("PLACE 0,0,WEST") }

            it "turns subject from west" do
               subject.do("RIGHT")

               expect(subject.x_position).to eq(0)
               expect(subject.y_position).to eq(0)
               expect(subject.direction).to eq(:north)
            end
         end
      end

      context "report" do
         context "of placed subject" do
            before { subject.do("PLACE 0,0,WEST") }

            it "shows place" do
               expect { subject.do("REPORT") }.to output("0,0,WEST\n").to_stdout
            end
         end

         context "of subject outside a board" do
            it "is ignored" do
               expect { subject.do("REPORT") }.to output("").to_stdout
            end
         end
      end
   end
end
