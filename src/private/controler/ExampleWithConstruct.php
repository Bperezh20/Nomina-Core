<?php

class ExampleWithConstruct
{
    /**
     * Contain message
     */
    protected $message;

    public function __construct($params)
    {
        if (!empty($params)) {
            if (isset($params['message'])) {
                $this->message = $params['message'];
            }
        }
    }

    /**
     * Return a simple message
     * @return string
     */
    public function printSimpleMessage()
    {
        print_r(json_encode($this->message));
    }
}
