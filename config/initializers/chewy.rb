# frozen_string_literal: true

Chewy.strategy(:atomic)
Chewy.logger = Logger.new($stdout)
Chewy.logger.level = Logger::INFO
