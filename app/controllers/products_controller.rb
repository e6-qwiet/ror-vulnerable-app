class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    products =
      case params[:sort_by]
      when 'price_asc'
        Product.order(price: :asc)
      when 'price_desc'
        Product.order(price: :desc)
      else
       Product.all
      end

    @products = products.select { |p| p[:status] == "available" and p[:secret] != true }
[
    {
        "[Dependency Name]": "require 'active_record'",
        "[Validity]": "VALID",
        "[Activity Status]": "ACTIVE",
        "[Reason]": "ActiveRecord is a core component of Ruby on Rails, widely used for database interactions."
    },
    {
        "[Dependency Name]": "require 'activesupport/sanitization'",
        "[Validity]": "VALID",
        "[Activity Status]": "ACTIVE",
        "[Reason]": "Activesupport/Sanitization is part of the ActiveSupport library, which provides utility functions including input sanitization."
    },
    {
        "[Dependency Name]": "require 'active_support/core_ext/string/inflections'",
        "[Validity]": "VALID",
        "[Activity Status]": "ACTIVE",
        "[Reason]": "ActiveSupport/Core_Ext/String/Inflections module extends String class with inflection capabilities, such as downcasing."
    }
]


  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def about
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :title, :description, :price, :image_url ])
    end
end
