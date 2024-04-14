# Weather Forecast Application

This is a Ruby on Rails application that allows users to retrieve weather forecast information for a given address. The application uses the Tomorrow.io API to fetch weather data and provides a user-friendly interface to display the current temperature, current day's high and low temperatures, and an extended forecast for the next few days.

## Features

- Accept an address as input
- Retrieve forecast data for the given address, including:
    - Current temperature
    - Current day's high and low temperatures
    - Extended forecast for the next few days
- Display the requested forecast details to the user
- Cache the forecast data for 30 minutes for subsequent requests with the same address
- Display an indicator if the result is pulled from the cache
- Responsive design for desktop, tablet, and mobile devices
- Error handling for invalid addresses or API failures

## Technologies Used

- Ruby on Rails 7
- Tomorrow.io API for weather data
- Geocoder gem for address geocoding
- HTTParty gem for making HTTP requests
- Rails cache for caching forecast data
- Weather Icons font for displaying weather icons
- Bootstrap for responsive styling

## Setup and Installation

1. Clone the repository:
   ```
   git clone https://github.com/your-username/weather-forecast.git
   ```

2. Navigate to the project directory:
   ```
   cd weather-forecast
   ```

3. Install the required gems:
   ```
   bundle install
   ```

4. Set up the Tomorrow.io API key:
    - Sign up for a Tomorrow.io account and obtain an API key.
    - Create a new file `config/initializers/tomorrow_io.rb` and add the following:
      ```ruby
      TOMORROW_IO_API_KEY = 'your_api_key_here'
      ```
      Replace `'your_api_key_here'` with your actual API key.

5. Start the Rails server:
   ```
   rails server
   ```

6. Open your web browser and visit `http://localhost:3000` to access the application.

## Usage

1. On the homepage, enter a valid address in the search field and click the "Get Forecast" button.

2. The application will retrieve the weather forecast data for the given address and display the following information:
    - Current temperature
    - Current day's high and low temperatures
    - Extended forecast for the next few days, including date, high, and low temperatures

3. If the forecast data for the same address is requested within 30 minutes, the application will retrieve the data from the cache, and an indicator will be displayed to show that the result is pulled from the cache.

4. The application is responsive and adapts to different screen sizes, providing an optimal viewing experience on desktop, tablet, and mobile devices.

5. If an invalid address is entered or if there is an error retrieving the forecast data from the API, appropriate error messages will be displayed to the user.

## Testing

The application includes unit tests to ensure the functionality of the weather forecast retrieval. To run the tests, use the following command:
```
rails test
```

## Future Enhancements

- Add support for multiple weather data providers to ensure data availability and accuracy.
- Implement user authentication and allow users to save their favorite locations.
- Provide more detailed weather information, such as hourly forecasts, precipitation chances, and weather alerts.
- Enhance the user interface with interactive weather maps and charts.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the GitHub repository.

## License

This project is open-source and available under the [MIT License](https://opensource.org/licenses/MIT).

## Contact

For any inquiries or feedback, please contact the project maintainer at your-email@example.com.

Feel free to customize the README file based on your specific application details, dependencies, and any additional information you want to include.