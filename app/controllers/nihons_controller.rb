class NihonsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
    def index
       
    end
    def post
      @nihons = Nihon.all
      @tag_list = Tag.all
    end

    def new
        @nihon = Nihon.new
        @nihon = current_user.nihons.new 
      end
    
      def create
       
       
        @nihon = current_user.nihons.new(nihon_params)           
        tag_list = params[:nihon][:tag_name].split(nil)  
        @nihon.user_id = current_user.id
        if @nihon.save
          @nihon.save_tag(tag_list)  
          redirect_to nihons_path
        else
          redirect_to new_nihon_path
        end
      end
    
      def show
        @nihon = Nihon.find(params[:id])

        @comments = @nihon.comments
        @comment = Comment.new

        @nihon_tags = @nihon.tags  
      end
      
      def edit
        @nihon = Nihon.find(params[:id])
        @tag_list=@nihon.tags.pluck(:tag_name).join(nil)
      end
      def update
        nihon = Nihon.find(params[:id])
        tag_list = params[:nihon][:tag_name].split(nil)
        if nihon.update(nihon_params)
         
          old_relations = TagMap.where(nihon_id: nihon.id)
          
          old_relations.each do |relation|
            relation.delete
          end
    
          nihon.save_tag(tag_list)
          redirect_to nihon_path(nihon.id), notice:'投稿完了しました:)'
        else
          redirect_to :action => "edit"
        end
        
        
      end

      def destroy
        nihon = Nihon.find(params[:id])
        nihon.destroy
        redirect_to action: :index
      end

      def search
        @tag_list = Tag.all               
        @tag = Tag.find(params[:tag_id])  
        @nihons = @tag.nihons.all          
      end
    
      private
      def nihon_params
        params.require(:nihon).permit(:picture, :kome, :image, :question, :body, :content )
      end
end
