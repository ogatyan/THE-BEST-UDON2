class TestsController < ApplicationController
    
    def new
        @test = Test.new
    end

    def create
        @test = Test.new(test_params)
        @test.result_type = calculate_result(@test)
        if @test.save
          redirect_to @test
        else
          render :new
        end
      end
    
    def show
        @test = Test.find(params[:id])
        @dashi = Tweet.where(genre: "ダシタイプ").order("RANDOM()").limit(3)
        @koshi= Tweet.where(genre: "コシタイプ").order("RANDOM()").limit(3)
        @guzai= Tweet.where(genre: "具材タイプ").order("RANDOM()").limit(3)
        @speed= Tweet.where(genre: "スピードタイプ").order("RANDOM()").limit(3)
        @neutral= Tweet.order("RANDOM()").limit(3)
    end
    
    
private
    def test_params
      params.require(:test).permit(
        :question1, :question2, :question3,
        :question4, :question5, :question6,
        :question7, :question8, :question9,
        :question10, :question11, :question12
      )
    end
    
    def calculate_result(test)
        #コシとダシと具材と早さのそれぞれのスコアを算出するための関数
        group_scores = {
          dashi:   test.question1.to_i + test.question2.to_i + test.question3.to_i,
          kosi:  test.question4.to_i + test.question5.to_i + test.question6.to_i,
          guzai:  test.question7.to_i + test.question8.to_i + test.question9.to_i,
          speed:  test.question10.to_i + test.question11.to_i + test.question12.to_i
        }
        #コシとダシと具材と早さで最もスコアが高いものを文字列として取得
        #9行目につながる(result_type)に格納する
      max_score = group_scores.values.max
        # 最大スコアが複数ある（同点）場合
        if group_scores.values.count(max_score) > 1
          "該当なし"
        else
          # 最大のスコアのカテゴリを返す
          group_scores.max_by { |_, v| v }[0].to_s
        end
    end

end