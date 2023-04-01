class ChatsController < ApplicationController
  def chat_emotional_value
    open_ai

    @query = params[:query]

    response = @client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: @query }],
      })
    @chats = response.dig("choices", 0, "message", "content")

    respond_to do |format|
      format.json { render json: { generated_text: @chats } }
    end
  end
end