library(jsonlite)

# Directory containing your JSON files
directory_path <- "/D:\Software Engineering"

# List all JSON files in the directory
json_files <- list.files(path = directory_path, pattern = "\\.json$", full.names = TRUE)

# Filter conversations where ListOfCode is empty from each file
filtered_data <- list()

for (json_file in json_files) {
  data <- fromJSON(json_file)

  for (source in data$Sources) {
    for (conversation in source$ChatgptSharing) {
      if ("Conversations" %in% names(conversation)) {
        for (prompt_answer in conversation$Conversations) {
          if (is.null(prompt_answer$ListOfCode)) {
            filtered_data <- append(filtered_data, list(Answer = prompt_answer$Answer))
          }
        }
      }
    }
  }
}

# Save the filtered data to a new JSON file
output_file_path <- "D:\Software Engineering"
writeLines(toJSON(filtered_data, pretty = TRUE), output_file_path)

cat("Filtered data saved to nonCodingQuestionsFilteredData.json\n")
