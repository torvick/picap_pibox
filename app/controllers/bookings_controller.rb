class BookingsController < ApplicationController

    def index
        @bookings = ApiPicap.get_bookings
    end

    def create
        @booking = ApiPicap.post_bookings(build_request)
        respond_to do |format|
            if !@booking.nil?  &&  @booking['_id'].present?
                format.html { redirect_to booking_path(@booking['_id']), notice: "Bookings was successfully created." }
                format.json { render :show, status: :created, location: @booking }
            else
                format.html { render :new, notice: "#{@booking}" }
                format.json { render json: @booking, status: :unprocessable_entity }
            end
        end
    end

    def show
        @booking = ApiPicap.get_booking(params[:id])
    end

    def new; end

    private

    def build_request
        request = {booking: params[:booking]}
        request[:booking][:stops] = [request[:booking][:stops]["1"]]
        request[:booking][:stops][0][:packages] = [request[:booking][:stops][0][:packages]['1']]
        request
    end

end