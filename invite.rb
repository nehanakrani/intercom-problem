require_relative './lib/invitation'
FILE_PATH = './input/customer_data.txt'
UNIT = 'km'

Invitation.new(FILE_PATH, 53.339428, -6.257664, 100, UNIT).call