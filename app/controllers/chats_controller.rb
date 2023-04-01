class ChatsController < ApplicationController
  def open_ai
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end
  def chat_emotional_value
    open_ai
    case
    when params[:Synonym]
      @Synonym = params[:Synonym]
      additional_prompt = "入力された文章の、言い換えを５つあげてください。"
      response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [
              { role: "system", content: additional_prompt },
              { role: "user", content: @Synonym  },
            ],
        })
      @chats = response.dig("choices", 0, "message", "content")
      chat_log = current_user.chat_logs.new(input: @Synonym , output: @chats)
      chat_log.save
    when params[:emotional_value]
      @chat_emotional_value = params[:emotional_value]
      additional_prompt = "入力された文章を、1~100までの感情値として一行以内で返してください。語尾にはにゃをつけてください。"
      response = @client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [
              { role: "system", content: additional_prompt },
              { role: "user", content: @chat_emotional_value },
            ],
        })
      @chats = response.dig("choices", 0, "message", "content")
      chat_log = current_user.chat_logs.new(input: @chat_emotional_value, output: @chats)
      chat_log.save
    end
    render json: { generated_text: @chats }
  end
end