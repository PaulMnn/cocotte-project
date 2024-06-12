class OpenaiService

  def initialize(attrs)
    @client = OpenAI::Client.new
    @url = attrs[:url]
  end

  def call
    result = @client.chat(parameters: self.query_params)
    JSON.parse(result["choices"][0]["message"]["content"])
    # begin

    # rescue => exception
    #   {}
    # end
  end

  private

  def query_params
    {
      model: "gpt-4o",
      messages: [
        {
          role: "user",
          content: [
            {
              type: "text",
              text: self.prompt
            },
            {
              type: "image_url",
              image_url: {
                url: @url
              }
            }
          ]
        }
      ],
      max_tokens: 300
    }
  end

  def prompt
    "
    ### Prompt:

    ---

    **Objet**: Extraction de Recette Manuscrite

    **Instructions**:

    1. **Extraction de Zones de Texte**:
      - Identifier les zones de texte manuscrit dans une image fournie contenant une recette.

    2. **Extraction de Texte Manuscrit**:
      - Extraire le texte manuscrit présent dans chaque zone identifiée.
      - Séparer le texte en trois catégories : le titre de la recette, les ingrédients, et les étapes de préparation.

    3. **Formatage du Résultat**:
      - Le texte extrait de chaque catégorie doit être rangé sous forme de JSON.
      - Le JSON doit suivre la structure suivante :

    \"{
        \"title\": \"Titre de la recette\",
        \"ingredients\": \"Liste des ingrédients\",
        \"preparation_steps\": \"Étapes de préparation\"
    }\"

    4. **Restitution**:
      - Seul le JSON doit être restitué sans être encadré par les caractères \"\`\`\`json\`\`\`\"
    "
  end
end
